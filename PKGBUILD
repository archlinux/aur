# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ativayeban
pkgname=${_pkgname}-git
pkgver=r7.b85db68
pkgrel=4
pkgdesc="Fall through a labyrinth. Avoid getting crushed!"
arch=('any')
url="https://github.com/Nebuleon/ativayeban"
license=('GPL2')
makedepends=('git')
depends=('sdl' 'sdl_image')
source=("git+https://github.com/Nebuleon/ativayeban.git"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'addf504723793e02312c3fab83a720e54f30ad1f5e58657b31cf42aab54d4a0f'
            '3bd1be11fc2db97307de4870b27e81e6c5b894f782b079ab9884b7c94995469f')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install "${srcdir}/${_pkgname}/${_pkgname}" -Dm755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install "${srcdir}/${_pkgname}/penguin_ball.png" -Dm644 "${pkgdir}/opt/${_pkgname}/penguin_ball.png"
  install "${startdir}/${_pkgname}.sh" -Dm755 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
