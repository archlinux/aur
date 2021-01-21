# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=mercure
pkgver=0.11.0
pkgrel=1
pkgdesc='Server-sent live updates: protocol and reference implementation'
arch=('any')
url='https://mercure.rocks'
install='mercure.install'
license=('AGPL-3.0')

makedepends=('git' 'go')

source=('mercure.service'
        "mercure::git+https://github.com/dunglas/mercure#tag=v${pkgver}")

sha256sums=('277572c9cbc93b74b368aec4fd40a8a9542d220e74b14383ef68e24630b2a4dc'
            'SKIP')

build() {
    cd "${srcdir}/mercure"
    go build .
}

package(){
  install -Dm 755 "${srcdir}/mercure/mercure" "$pkgdir/usr/bin/mercure"
  install -Dm 755 mercure.service "$pkgdir"/usr/lib/systemd/system/mercure.service
}
