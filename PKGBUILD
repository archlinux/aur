# Maintainer: ohemilyy <ohemilyy@proton.me>
pkgname=flavor-bin
pkgver=0.1.0beta3
_ver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc='Several Tailscale and Headscale networks side by side, in one desktop app and daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/tame-gg/Flavor'
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
optdepends=('polkit: system-wide names through the flavor-netd helper')
provides=('flavor')
conflicts=('flavor')
backup=('etc/apparmor.d/flavor-netd')
options=('!strip' '!debug')
install=flavor-bin.install
validpgpkeys=('0DFC432162BF84C0FD780619FBB96BCEC0361F01')
source=("SHA256SUMS-$_ver::$url/releases/download/v$_ver/SHA256SUMS"
        "SHA256SUMS-$_ver.asc::$url/releases/download/v$_ver/SHA256SUMS.asc")
source_x86_64=("$url/releases/download/v$_ver/flavor-$_ver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$_ver/flavor-$_ver-linux-arm64.tar.gz")
sha256sums=('c12e61bc68c1095bfa780e1751615a0f3a82632b257bea03fdbba4f369b492c0'
            'SKIP')
sha256sums_x86_64=('9e4dee923b2c77010a7595a3f1ffe0fdbaa711657682884c68129b7ede99073b')
sha256sums_aarch64=('e6e40a1f1ac67f0be0c820bf958714ce4ba313b7a4e0ad19e4d8927ecacc29d9')

prepare() {
  sha256sum --check --ignore-missing "SHA256SUMS-$_ver"
}

package() {
  local _arch=amd64
  [[ $CARCH == aarch64 ]] && _arch=arm64
  cd "flavor-$_ver-linux-$_arch"
  cp -a usr etc "$pkgdir/"
  rm "$pkgdir/usr/libexec/flavor/uninstall" "$pkgdir/usr/share/flavor/manifest"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
