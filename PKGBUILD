# Maintainer: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=xhtml-docs
pkgver=1.1
pkgrel=4
pkgdesc="Set of HTML documentation for XHTML 1.0 & 1.1"
arch=('any')
url="http://www.w3.org/"
license=('GPL')

makedepends=('rsync')

options=('docs')

source=('http://www.w3.org/TR/xhtml11/xhtml11.tgz'
        'http://www.w3.org/TR/xhtml1/xhtml1.tgz'
        'xhtml-docs.install')
sha512sums=('8a38a61d44809459f1f8b02992a623836df1b4b7fb6b5e844ca039264d4c99e80170c84d8b90dede7142f5972e9668f4ff71c9e0ded82887e5b4116cf56a8506'
            '184758381c5e2d36b80fa1e4470e864777383ff7539b48291036f8a3f1dba0b354a32142bfcc9071147fb20bcd4c0d4d541e09e865047938ab4cf9ae5a806412'
            'dc2130bd15792b766bb5c3588ee999dcc3b90c78fbf5f4ec8e4eeebd6c5977ca787f44aa4fa32e6301df13be8ec1274d820fd9cd35e2b72cd51a94fea01b5996')

install=('xhtml-docs.install')

package(){
  # no need to traverse into $pkgname, since we're actually just copying its contents...

  install -d "${pkgdir}/usr/share/doc/xhtml"
  rsync -av xhtml1-20020801/ "${pkgdir}/usr/share/doc/xhtml/1.0" --exclude DTD
  rsync -av xhtml11-20101123/ "${pkgdir}/usr/share/doc/xhtml/1.1" --exclude DTD --exclude SCHEMA
  rsync -av xhtml1-20020801/DTD/ "${pkgdir}/usr/share/doc/xhtml/DTD"
  rsync -av xhtml11-20101123/DTD/ "${pkgdir}/usr/share/doc/xhtml/DTD"
  rsync -av xhtml11-20101123/SCHEMA/ "${pkgdir}/usr/share/doc/xhtml/SCHEMA"
  ln -s "${pkgdir}/usr/share/doc/xhtml/DTD" "${pkgdir}/usr/share/doc/xhtml/1.0/DTD"
  ln -s "${pkgdir}/usr/share/doc/xhtml/DTD" "${pkgdir}/usr/share/doc/xhtml/1.1/DTD"
  ln -s "${pkgdir}/usr/share/doc/xhtml/SCHEMA" "${pkgdir}/usr/share/doc/xhtml/1.1/SCHEMA"
}
