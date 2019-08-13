# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=lynda-dl
pkgver=0.3
pkgrel=3
pkgdesc='Tool to download courses from Lynda'
arch=(any)
url=https://github.com/r0oth3x49/lynda-dl
license=(MIT)
depends=(python-requests
         python-six
         python-colorama
	 python-unidecode
         python-pyopenssl)
source=(lynda-dl-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        setup.py)
sha512sums=('29ab76a2bac6fa07c453ef578d754a1ef1cfaf643251a8d3203a11f93f85128445112fa54fd9e9933d35bea71dc3746bdfc00e71dbc13944de1b024ef6394b11'
            '3e76a6678bf00708437fab400ded30d2169a88180ea77d51badecba14ba7649645791500e7d0649be15c25f7980c6d17f8f3a3a4bbf65782dac29556266ec6ee')

package() {
  cd lynda-dl-$pkgver

  # Current release is missing setup script
  cp ../setup.py .

  # Move main script so everything installs to site-packages
  mv lynda-dl.py lynda/lynda_dl.py

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/lynda-dl
}
