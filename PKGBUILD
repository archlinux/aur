# Maintainer PumpkinCheshire <sollyonzou@gmail.com>
# Maintainer: robertfoster

pkgname=whatweb-git
_name=whatweb
pkgver=0.5.4.r0.36d284bf
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('i686' 'x86_64')
replaces=('whatweb')
conflicts=('whatweb')
provides=('whatweb')
url="http://www.morningstarsecurity.com/research/whatweb"
license=('GPL')
depends=('ruby' 'ruby-addressable')
optdepends=('ruby-rake: development test use'
           'ruby-rdoc: development test use'
           'ruby-minitest: development test use'
           'ruby-rubocop: development test use'
           'ruby-bundler-audit: development test use'
           'ruby-pry: debugging')
source=("whatweb::git://github.com/urbanadventurer/WhatWeb.git")
md5sums=('SKIP')

prepare() {
    cd $_name
    sed -i '/bundle install/d' Makefile
    sed -i "s|require 'lib/whatweb'|require '/usr/share/whatweb/lib/whatweb'|" whatweb
}

package() {
	cd $_name
	make DESTDIR=$pkgdir install
}

pkgver() {
	cd $_name
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}


