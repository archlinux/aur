# Maintainer: Violeta Veras <vverasagreda at gmail dot com>
# Contributor: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>

pkgname=spaceship-prompt
pkgver=4.22.5
pkgrel=1
pkgdesc="A Zsh prompt for Astronauts"
arch=('any')
url="https://spaceship-prompt.sh/"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=('spaceship-zsh-theme' 'spaceship-prompt')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "$pkgname.install")
sha256sums=('2b82500b06efd7bca5c5a104279d247ec24466f90f38df0e65cbfa4509e67fe9'
            '9fb9218c6498c040461d8d7aa416b2eb9241317b5606e74d1ec1caed0709aaf4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    find docs -type f -exec install -D -m644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

    find lib -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    find scripts -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    find sections -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
    install -D -m644 spaceship.zsh "${pkgdir}/usr/lib/${pkgname}/spaceship.zsh"
    install -D -m644 async.zsh "${pkgdir}/usr/lib/${pkgname}/async.zsh"
    ln -s spaceship.zsh "${pkgdir}/usr/lib/${pkgname}/spaceship.zsh-theme"

    install -d "${pkgdir}/usr/local/share/zsh/site-functions/"
    ln -s "/usr/lib/${pkgname}/spaceship.zsh" "${pkgdir}/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
}
