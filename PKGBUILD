# Maintainer: ohemilyy <ohemilyy@proton.me>
pkgname=flavor-bin
pkgver=0.1.0beta9
_ver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc='Use multiple Tailscale and Headscale tailnets at once (desktop app, CLI, daemon)'
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
sha256sums=('35669e9d2a153269093c91be6476aaa17f7cb62cb2da030f6df82d8c109cba6f'
            'SKIP')
sha256sums_x86_64=('8f5bbe5a478e140a11f3d7ebe3947fbc3e5d2f18990b875160985b9bb4a9e9e2')
sha256sums_aarch64=('4ebe749e90b8c178f9feb78b064d82eb157b7904467250159d905a70e6c4cefb')

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
