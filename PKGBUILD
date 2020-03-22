# Maintainer: sdvcrx <memory.silentvoyage at gmail.com>

pkgname=clash-bin
_pkgname=clash
pkgver=0.19.0
pkgrel=1
pkgdesc="A rule based proxy in Go."
url="https://github.com/Dreamacro/clash"
license=("MIT")
arch=("x86_64")
provides=("clash")
conflicts=("clash" "clash-git")
depends=("glibc")
source=(clash@.service
        clash_user.service
        "$_pkgname-$pkgver.gz::${url}/releases/download/v${pkgver}/clash-linux-amd64-v${pkgver}.gz")
noextract=("$_pkgname-$pkgver.gz")
sha256sums=(
        "5742063861d24f959a6aed1eecbcdfde772e63dcf1e9104690d4255d6967e656"
        "71a8880111f577df201c8c73300616a01411f14a6a7d14a18c768e469dc71541"
        "ef212c730e204db02c7e4dc235c7829e55560dc7da8b7602736f188ee5acfe79"
)

install=$_pkgname.install

prepare() {
  cd "${srcdir}/"
  gunzip -k -f "$_pkgname-$pkgver.gz"
}

package() {
  cd "${srcdir}/"

  install -Dm755 "$_pkgname-$pkgver" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 clash@.service ${pkgdir}/usr/lib/systemd/system/clash@.service
  install -Dm644 clash_user.service ${pkgdir}/usr/lib/systemd/user/clash.service
}

