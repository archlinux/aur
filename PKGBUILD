# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=regd
pkgver=0.5.0
pkgrel=1
pkgdesc="Registry daemon, information cache and secure credential storage."
arch=('any')
url="https://github.com/nbdsp/regd"
license=('GPL')
groups=()
depends=('python3')
optdepends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::https://github.com/nbdsp/regd/archive/v0.5.0.tar.gz")
noextract=()
md5sums=('SKIP')


package() {
	_username="$(id | sed -e 's/[^(]*(\([^)]*\)).*/\1/')"
	_confdir="$pkgdir/${HOME}/.config/${pkgname}"
	_datadir="$pkgdir/${HOME}/.config/${pkgname}/data"
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir "${_confdir}" 
	mkdir "${_datadir}"
	chown $_username "${_confdir}"
	chown $_username "${_datadir}"
	install -Dm644 -o $_username "data/conf.${pkgname}" "$pkgdir/etc/${pkgname}/conf.${pkgname}"
	install -Dm644 -o $_username "data/${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
	install -Dm600 -o $_username "data/${pkgname}.data" "/${_datadir}/${pkgname}.data"
}
