# Maintainer: xuanxuan1231 <xuanxuan1231 at helloswx dot top>

pkgname=hmcl-region-patch-auto
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial tool that patches the HMCL installed by the AUR, so that it no longer treats the machine as mainland China"
arch=('any')
url="https://github.com/xuanxuan1231/hmcl-region-patch"
license=('GPL-3.0-or-later')
depends=('java-runtime' 'hmcl')
options=('!strip')
install="$pkgname.install"
conflicts=('hmcl-region-patch')

# The archive is built and uploaded by the GitHub workflow that runs when a tag is pushed, so
# the package only installs it: everything the tool needs, including the ASM library, is inside.
source=("hmcl-region-patch-$pkgver.tar.gz::https://github.com/xuanxuan1231/hmcl-region-patch/releases/download/v$pkgver/hmcl-region-patch-$pkgver.tar.gz"
        "hmcl-region-patch.hook")
sha256sums=('89c6da7b5727f85b331d89d02e5a4c0edc605a281f25d38676decc9a215d9fd4'
            '572e7c76fdb1ca83ef188883ce91ba2d9123b4ced0bc6eeec2cf475c42534862')

package() {
    install -Dm644 "$srcdir/hmcl-region-patch-$pkgver/lib/hmcl-region-patch.jar" \
        "$pkgdir/usr/share/java/$pkgname/hmcl-region-patch.jar"
    install -Dm755 "$srcdir/hmcl-region-patch-$pkgver/bin/hmcl-region-patch" \
        "$pkgdir/usr/bin/hmcl-region-patch"
    install -Dm644 "$srcdir/hmcl-region-patch-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/hmcl-region-patch-$pkgver/licenses/ASM-LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/ASM-LICENSE.txt"

    # The hook that patches HMCL again whenever it is installed or updated.
    install -Dm644 "$srcdir/hmcl-region-patch.hook" \
        "$pkgdir/usr/share/libalpm/hooks/hmcl-region-patch.hook"

    # The directory that holds the backups and the state of the patched archives.
    install -dm755 "$pkgdir/var/lib/hmcl-region-patch"
}
