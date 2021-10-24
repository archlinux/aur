# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>
pkgname=openbsd-manpages
pkgver=7.0
pkgrel=2
pkgdesc="The OpenBSD manuals"
arch=('any')
options=('!strip')
url="https://man.openbsd.org/"
# Change this to your local mirror for faster downloads
# See https://www.openbsd.org/ftp.html
_mirrorurl="https://ftp.openbsd.org/pub/OpenBSD"
license=('BSD')
source=("${_mirrorurl}/${pkgver}/openbsd-${pkgver//./}-base.pub"
        "SHA256::${_mirrorurl}/${pkgver}/amd64/SHA256.sig"
        "${_mirrorurl}/${pkgver}/amd64/man${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/comp${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/xshare${pkgver//./}.tgz"
        'manfmt')
sha256sums=('db407b2015126ec80cedebb9b3248ee3c3a6e9369236828db758e6898c05fdbd'
            'c67fb553cdb3ff4c76d3d2a41cb197b4edde02bda64cef3203b404b9904bfdd3'
            'f4286a6c13aa861f5092fd5eaa3ba1e414e60901773d6739d00ec8b4a524d489'
            '0508b0b0c9adf26bdb6a5d650dab232c60864ebdc6a1c1f1c716669a20445fa2'
            '43b7ed233bd820de8a0c87bf50060be915e2869d96433e4b598ed15c00fb7e13'
            '335fa03d90fa0829327b8ba861fd5fda18d8da83a3d3e04ff21fde27037b62bb')

package() {
  mkdir -p ${pkgdir}/usr/share/man/man{1,2,3,4,5,7,8,9}

  msg2 "Reformatting for consistency with the Linux manuals (this may take a while...)"
  export srcdir pkgdir pkgver
  rm -rf "$srcdir/usr/share/man/man3p"
  find ${srcdir}/usr/{share,X11R6}/man/man*/* -maxdepth 0 -type f |
    xargs -P "$(nproc)" -n 1 "$srcdir/manfmt"
}
