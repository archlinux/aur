# Maintainer: ohemilyy <ohemilyy@proton.me>
pkgname=flavor-bin
pkgver=0.1.0beta10
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
sha256sums=('104ba62a154e26f8b772a224ad56b7020e800741eb2ccc7d4d098bd9daad7577'
            'SKIP')
sha256sums_x86_64=('122adae0ce6113cafe2938e2280ec54b35eb26cdc61554c9ca390e094911822a')
sha256sums_aarch64=('282c45305c0909b1967f03b3dcbe0c04ecd90fc114a6542f877d4282da2a3247')

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
