# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=lynda-dl-git
pkgver=0.3+3+gafa9782
pkgrel=1
pkgdesc='Tool to download courses from Lynda (git)'
arch=(any)
url=https://github.com/r0oth3x49/lynda-dl
license=(MIT)
depends=(python-requests
         python-six
         python-colorama
	 python-unidecode
         python-pyopenssl)
conflicts=(lynda-dl)
source=(git+$url
        setup.py)
sha512sums=('SKIP'
            '3e76a6678bf00708437fab400ded30d2169a88180ea77d51badecba14ba7649645791500e7d0649be15c25f7980c6d17f8f3a3a4bbf65782dac29556266ec6ee')

pkgver() {
  cd lynda-dl
  git describe --tags | sed 's/v//;s/-/+/g'
}

package() {
  cd lynda-dl
  cp ../setup.py .
  mv lynda-dl.py lynda/lynda_dl.py
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/lynda-dl/LICENSE
}
