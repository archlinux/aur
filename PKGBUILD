# Contributor: Jeff Cook <jeff@deserettechnology.com>
# Contributor: Michael Asher < michael at we solve every thing dot com >
# Contributor: William Díaz <wdiaz@archlinux.us>
# Maintainer: adminempier <jl@adminempire.com>
### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=uuid
pkgver=1.6.2
pkgrel=12
pkgdesc="OSSP Universally Unique Identifier"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.ossp.org/pkg/lib/uuid"
license=('MIT')
depends=('sh')
options=('!libtool')
source=("http://www.mirrorservice.org/sites/ftp.ossp.org/pkg/lib/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        ossp.patch)
sha512sums=('16c7e016ce08d7679cc6ee7dec43a886a8c351960acdde99f8f9b590c7232d521bc6e66e4766d969d22c3f835dcc2814fdecc44eef1cd11e7b9b0f9c41b5c03e'
            '36d0ea6088c12a5e382c3098f11214b202e96f91e4efd5cac567d5a81e836f78eeb654f051c576a211ec2dd5337b1f0a20d4246e84a0842fce22ae5fa96e5be9')

build() {
  cd "${pkgname}"-"${pkgver}"
  # Rename because conflicts with util-linux
  patch -p1 -i "${srcdir}"/ossp.patch
  ./configure --prefix=/usr --with-perl
  make
}

package() {
  cd "${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README  "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
