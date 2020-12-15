# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: robertfoster

pkgname=whatweb
_name=WhatWeb
pkgver=0.5.4
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('x86_64')
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
sha256sums=('73e1b8592bf5a15f8a66fffe2408732c434b7068f5d3379cc889fad14ea513ee')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    sed -i '/bundle install/d' Makefile
    sed -i "s|require 'lib/whatweb'|require '/usr/share/whatweb/lib/whatweb'|" whatweb
}

package() {
    cd "$srcdir/$_name-$pkgver"
    make DESTDIR=$pkgdir install
}
