# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-login-required-middleware'
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc='Provide login to all requests through middleware'
arch=('any')
url='https://pypi.org/project/django-login-required-middleware/'
license=('MIT')
depends=(
	'python-django'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('847ae9a69fd7a07618ed53192b3c06946af70a0caf6d0f4eb40a8f37593cd970')

build() {
	cd "${_name}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
