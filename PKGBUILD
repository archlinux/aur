# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>

pkgname=ansible-docs-git
pkgdesc="Ansible HTML documentation"
pkgver=20150107
pkgrel=1
arch=('any')
url="https://github.com/ansible/ansible"
license=('GPL3')                # true?
options=('!strip')
makedepends=('git' 'python2-sphinx')
source=('git://github.com/ansible/ansible.git')
md5sums=('SKIP')

pkgver() {
    date "+%Y%m%d"
}

prepare() {
    find "$srcdir"/ansible -name '*.py' -exec \
        sed -i 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' {} +
}

build(){
    make -C "$srcdir"/ansible webdocs
}

package() {
    install -dm755 "$pkgdir/usr/share/doc/ansible/html"
    cp -r "$srcdir"/ansible/docsite/htmlout/* "$pkgdir/usr/share/doc/ansible/html/"
}
