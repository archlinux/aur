# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vy
pkgver=4.3.0
pkgrel=1
pkgdesc='A vim-like text editor in python, made from scratch'
arch=('any')
url="https://github.com/vyapp/vy"
license=('MIT')
depends=('python-vulture'
         'python-pyflakes'
         'python-jedi'
         'python-pygments'
         'python-future'
         'python-rope'
         'mypy'
         'python-untwisted')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vyapp/vy/archive/v${pkgver}.tar.gz")
sha256sums=('d8004e4298049c73625270deb49f47ab650f48af333b87ff279839c042b90246')

package() {
  cd "vy-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 vy.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "vy" \
            --comment "$pkgdesc" \
            --exec "${pkgname}" \
            --categories 'TextEditor;Development;' \
            --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
