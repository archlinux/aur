# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>
pkgname=openbsd-manpages
pkgver=7.1
pkgrel=1
pkgdesc="The OpenBSD manuals"
arch=('any')
options=('!strip')
url="https://man.openbsd.org/"
# Change this to your local mirror for faster downloads
# See https://www.openbsd.org/ftp.html
_mirrorurl="https://ftp.openbsd.org/pub/OpenBSD"
license=('BSD')
source=("${_mirrorurl}/${pkgver}/amd64/man${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/comp${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/xshare${pkgver//./}.tgz"
        'manfmt')
sha256sums=('e146aa58de24fd3662e1120fae5243ac51b8a5c5d0f3b37afde70e9a1af44027'
            '55642ffa1f6044bf4bcddb4f40d26553ea75ffccf10a50da37ac7ef963b5c99b'
            '8ae5bb36df9b68e33264b26f530b2c9df83c3c677a43c152c342f7d21c443d3b'
            '335fa03d90fa0829327b8ba861fd5fda18d8da83a3d3e04ff21fde27037b62bb')

package() {
  mkdir -p ${pkgdir}/usr/share/man/man{1,2,3,4,5,7,8,9}

  msg2 "Reformatting for consistency with the Linux manuals (this may take a while...)"
  export srcdir pkgdir pkgver
  rm -rf "$srcdir/usr/share/man/man3p"
  find ${srcdir}/usr/{share,X11R6}/man/man*/* -maxdepth 0 -type f |
    xargs -P "$(nproc)" -n 1 "$srcdir/manfmt"
}
