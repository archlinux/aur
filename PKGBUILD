# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=afancontrol
_name=${pkgname#python-}
pkgver=2.0.0b5
pkgrel=1
pkgdesc="afancontrol measures temperature from the sensors, computes the required airflow and sets the PWM fan speeds accordingly"
arch=('any')
url="https://afancontrol.readthedocs.io/en/latest/"
license=('MIT')
depends=('python' 'lm_sensors')
makedepends=('python-setuptools')
optdepends=('hddtemp: for measuring HDD/SSD temperatures')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('9221b8fb095db16ce3868117ec22578900e9f7edd82dd786b49bfcb8dee0e1334fdf73f2227e176f7e12f1dae24cb74b0b5118f80bc0ea8b625b4bc9be3a0fca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  mv "${pkgdir}/usr/etc/systemd" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
