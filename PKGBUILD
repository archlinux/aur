# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream-git
pkgver=0.1+1154+ga10b9ce
pkgrel=1
pkgdesc="Flexible and extensible framework for the modelling of build pipelines in a declarative YAML format, written in python"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click'
         'python-fusepy' 'python-gobject' 'python-pluginbase'
         'python-psutil' 'python-ruamel-yaml')
makedepends=('python-setuptools' 'git')
provides=('buildstream')
conflicts=('buildstream')
source=("git+https://gitlab.com/BuildStream/buildstream.git")
md5sums=('SKIP')

pkgver() {
	cd buildstream
	v=$(grep "^release =" doc/source/conf.py | cut -d= -f2 | sed "s|'||g")
	r=$(git rev-list --count HEAD)
	h=$(git rev-parse --short HEAD)
	printf $v+$r+g$h
}

package() {
	cd buildstream
	python setup.py install --root="$pkgdir/" --optimize=1
}
