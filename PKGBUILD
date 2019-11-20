# Maintainer: Your Name <youremail@domain.com>
pkgname=patroni-git
pkgver=1.6.1
pkgrel=1
pkgdesc="A template for PostgreSQL High Availability with ZooKeeper, etcd, or Consul "
arch=("any")
url="https://github.com/zalando/patroni"
license=('MIT')
depends=('python-psycopg2' 'python-urllib3>=1.19.1' 'python-urllib3<>1.21' 'python-pyaml' 'python-requests' 'python-six>=1.7' 'python-click>=4.1' 'python-prettytable>=0.7' 'python-tzlocal' 'python-dateutil' 'python-psutil>=2.0.0' 'python-cdiff')
optdepends=( 'python-boto: aws'
	'python-etcd: etcd'
	'python-consul: consul'
	'python-kazoo: exhibitor, zookeeper'
	'python-kubernetes: kubernetes')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/zalando/patroni.git")
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${pkgname}"
	python -c 'from patroni.version import __version__;print(__version__)'
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
