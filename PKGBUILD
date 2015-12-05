# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client-cli
pkgver=5.0.2
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile cli client for synchronizing your local files with seafile server."
arch=('any')
url="https://github.com/haiwen/seafile/"
license=('GPL3')
depends=('seafile-shared=5.0.2' 'libevent')
makedepends=('vala')
options=('!libtool' '!emptydirs')
source=("seafile-client-cli-v${pkgver}.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}-server.tar.gz")

build () {
    cd "$srcdir/seafile-${pkgver}-server"
    ./autogen.sh
    ./configure --disable-server --enable-client --disable-console --prefix=/usr PYTHON=/usr/bin/python2
    make -j1

    # Fix cli client's python 2 requirement
    sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' app/seaf-cli
}

package () {
    cd "$srcdir/seafile-${pkgver}-server"
    # Install cli client
    install -D -m755 app/seaf-cli ${pkgdir}/usr/bin/seaf-cli
}

sha256sums=('ce34339bdad50afb9bacb3cbf854e3c33a311dfb868b2ec32a812ca78845b43f')
