# Maintainer: Moraxyc <i@qaq.li>

pkgname=artalk-bin
_pkgname=${pkgname%-bin}
pkgver=2.9.1
pkgrel=1
pkgdesc="A self-hosted comment system"
arch=("aarch64" "x86_64")
url="https://github.com/ArtalkJS/Artalk"
license=('MIT')
depends=('glibc')
provides=(${_pkgname})
source=("artalk.service" "artalk.sysusers" "artalk.tmpfiles")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v$pkgver/artalk_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v$pkgver/artalk_v${pkgver}_linux_amd64.tar.gz")
options=(!debug)
sha256sums=('089beb9843b735b597b93c727595fbded272261c2f54e193f73e3db36da5f00e'
            '12b14875a5e62d6a2a160a793285001621dac16539f8e2f1cee800644a62349e'
            '401cc7b81993810bb39285b244c6be7bae669f11c133bc676b3405581eb3e96d')
sha256sums_aarch64=('87198bdd8dc7c19958c0ebdd0591c1d5c97e184616347a75ec11bebf52939582')
sha256sums_x86_64=('7e05d66a1250abcb70f93581206c1e832c7a77e39d758913330885005e880b56')

package() {
    install -Dm755 artalk_v${pkgver}_linux*/artalk ${pkgdir}/usr/bin/artalk
    install -Dm644 artalk_v${pkgver}_linux*/README.md -t $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 artalk_v${pkgver}_linux*/README.en.md -t $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 artalk_v${pkgver}_linux*/LICENSE      $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 artalk.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 artalk.sysusers ${pkgdir}/usr/lib/sysusers.d/artalk.conf
    install -Dm644 artalk.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/artalk.conf
}
