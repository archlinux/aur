# Maintainer: ohemilyy <ohemilyy@proton.me>
pkgname=flavor-bin
pkgver=0.1.0beta2
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
sha256sums=('9a3e6fc15a24f72bd39bd873e5354d5c7db3227dfa66dc074787d13bf48f58e3'
            'SKIP')
sha256sums_x86_64=('7f81284a5701f90dd54377fd71d2be15cb5835ec740ac97df2b4bca3b9cd4673')
sha256sums_aarch64=('48b4638644addfe720912cbe1424444b4fb12b7feba0c98bd3aabe53022771df')

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
