# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: robertfoster

_pkgauthor=urbanadventurer
_pkgname=WhatWeb
pkgname=${_pkgname,,}
pkgver=0.6.4
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."

arch=('x86_64')
license=('GPL-2.0')
url="https://github.com/${_pkgauthor}/${_pkgname}"

provides=("${pkgname}")
conflicts=("${pkgname}"{-git,-bin})

depends=('bash' 'ruby' 'ruby-addressable')
optdepends=('ruby-rake: development test use'
            'ruby-rdoc: development test use'
            'ruby-minitest: development test use'
            'ruby-rubocop: development test use'
            'ruby-bundler-audit: development test use'
            'ruby-pry: debugging')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('611cde154ad864ffc430ac34e87ca746dbe0f0cc47a116ba06de3cb61e923b15')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    sed -i '/bundle install/d' "Makefile"
    sed -i "s|require 'lib/whatweb'|require '/usr/share/whatweb/lib/whatweb'|" "whatweb"
}


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} install
}
