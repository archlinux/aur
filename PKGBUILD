# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: David Trail <david@vaunt.eu>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=imgurbash
pkgver=4
pkgrel=4
pkgdesc="A simple bash script to upload an image to imgur from the commandline"
arch=('any')
url="https://imgur.com/tools/"
license=('custom:PublicDomain')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
	'xclip: an alternative to xsel')
source=("https://imgur.com/tools/imgurbash.sh"
        "001-api-v3.patch")
sha256sums=('41310047e634c4be5471d0470b7e862b7f27158fdc6afd2fc1a17fbc8b6da79a'
            '015b293ae2a21c0013b866d5f2e7395c05c5eaacfd7758cdb6e989a57b3896c6')

prepare() {
  patch -p1 --follow-symlinks < "001-api-v3.patch"
}

package() {
  install -D -m 755 imgurbash.sh "${pkgdir}/usr/bin/imgurbash"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '/imgur script/,/you will./p' imgurbash.sh \
    > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
