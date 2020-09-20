# Maintainer: Jingbei Li <i@jingbei.li>

pkgname=python-ruamel-yaml-hg
_hgname=yaml
pkgver=0.16.12.r4.7858379dfa6e
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('any')
url="https://sourceforge.net/projects/ruamel-yaml/"
license=('MIT')
groups=('devel')
depends=('python')
makedepends=('python-pip' 'mercurial' 'wget')
provides=('python-ruamel-yaml')
conflicts=('python-ruamel-yaml-hg')
source=("${_hgname}::hg+http://hg.code.sf.net/p/ruamel-yaml/code")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	hg log -r . --template '{latesttag}.r{latesttagdistance}.{node|short}\n'
}

#prepare() {
#	_pkgver=${pkgver/.r*/}
#	cd $srcdir
#	[ ! -f ruamel.yaml-$_pkgver.tar.gz ] && wget -O ruamel.yaml-$_pkgver.tar.gz "https://pypi.io/packages/source/r/ruamel.yaml/ruamel.yaml-$_pkgver.tar.gz"
#	tar zxvf ruamel.yaml-$_pkgver.tar.gz
#	cp ruamel.yaml-$_pkgver/setup.py $_hgname
#}

build() {
	cd "$srcdir/$_hgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_hgname"
	RUAMEL_NO_PIP_INSTALL_CHECK=1 \
	python setup.py install --root="$pkgdir"/ --optimize=1
	#pip install --root="$pkgdir" --ignore-installed --no-dependencies
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
