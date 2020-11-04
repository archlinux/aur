# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: robertfoster

pkgname=whatweb
_name=WhatWeb
pkgver=0.5.3
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('i686' 'x86_64')
url="http://www.morningstarsecurity.com/research/whatweb"
license=('GPL')
provides=('whatweb')
depends=('ruby' 'ruby-addressable')
optdepends=('ruby-rake: development test use'
           'ruby-rdoc: development test use'
           'ruby-minitest: development test use'
           'ruby-rubocop: development test use'
           'ruby-bundler-audit: development test use'
           'ruby-pry: debugging')
conflicts=('whatweb-git')
source=("https://github.com/urbanadventurer/WhatWeb/archive/v$pkgver.tar.gz")
sha256sums=('b4fc61455f1322862f47448835a25437746c9bd6ecca60f7a5c2166373ec77be')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    sed -i '/bundle install/d' Makefile
    sed -i "s|require 'lib/whatweb'|require '/usr/share/whatweb/lib/whatweb'|" whatweb
}


package() {
	cd "$srcdir/$_name-$pkgver"
	make DESTDIR=$pkgdir install
}


