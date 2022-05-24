# Maintainer PumpkinCheshire <sollyonzou@gmail.com>
# Maintainer: robertfoster

pkgname=whatweb-git
_name=WhatWeb
pkgver=0.5.5.r41.efee4d80
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
source=("git+https://github.com/urbanadventurer/WhatWeb")
b2sums=('SKIP')

pkgver() {
    cd $_name || exit
    printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd $_name || exit
    sed -i '/bundle install/d' Makefile
    sed -i "s|require 'lib/whatweb'|require '/usr/share/whatweb/lib/whatweb'|" whatweb
}

package() {
    cd $_name || exit
    make DESTDIR=$pkgdir install
}
