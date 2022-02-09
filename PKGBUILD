# Maintainer: liolok <aur@liolok.com>
# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=oicq
pkgver=2.1.9
pkgrel=1
pkgdesc="Tecent chat bot in nodejs"
arch=('any')
url="https://www.npmjs.com/package/$pkgname"
license=('MPL-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=()



noextract=($pkgname-$pkgver.tgz)

package() {
    npm i oicq@1 -g \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

#     install -dm755 "${pkgdir}/usr/bin"

#     cat <<EOF >> "${pkgdir}/usr/bin/oicq"
# "#!/usr/bin/env node
# 'use strict';
# require('/usr/lib/node_modules/oicq/lib')();" 
# EOF

#    chmod 755 "${pkgdir}/usr/bin/oicq"
    
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown --recursive root:root "${pkgdir}"
}
