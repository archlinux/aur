# Maintainer: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>

pkgname=xhtml-docs
pkgver=1.1
pkgrel=7
pkgdesc="Set of HTML documentation for XHTML 1.0 & 1.1"
arch=('any')
url="http://www.w3.org/"
license=('GPL')

makedepends=('rsync')
depends=('libxml2')

options=('docs')

source=('http://www.w3.org/TR/xhtml11/xhtml11.tgz'
        'http://www.w3.org/TR/xhtml1/xhtml1.tgz'
        'xhtml-docs.install')
sha512sums=('8a38a61d44809459f1f8b02992a623836df1b4b7fb6b5e844ca039264d4c99e80170c84d8b90dede7142f5972e9668f4ff71c9e0ded82887e5b4116cf56a8506'
            '184758381c5e2d36b80fa1e4470e864777383ff7539b48291036f8a3f1dba0b354a32142bfcc9071147fb20bcd4c0d4d541e09e865047938ab4cf9ae5a806412'
            '2eef06bf5b3eee0ffbebc72fb96094a33226bca2850e90b128e3379122966b748252a5bb2bf748d4e941a60f49a304bc32df1808104e32d5f21480d474b124d6')

install='xhtml-docs.install'

package(){
  # no need to traverse into $pkgname, since we're actually just copying its contents...

  install -dm755 ${pkgdir}/etc/xml
  install -d "${pkgdir}/usr/share/doc/xhtml"
  rsync -av xhtml1-20020801/ "${pkgdir}/usr/share/doc/xhtml/1.0" --exclude DTD
  rsync -av xhtml11-20101123/ "${pkgdir}/usr/share/doc/xhtml/1.1" --exclude DTD --exclude SCHEMA
  rsync -av xhtml1-20020801/DTD/ "${pkgdir}/usr/share/doc/xhtml/DTD"
  rsync -av xhtml11-20101123/DTD/ "${pkgdir}/usr/share/doc/xhtml/DTD"
  rsync -av xhtml11-20101123/SCHEMA/ "${pkgdir}/usr/share/doc/xhtml/SCHEMA"
  ln -s "/usr/share/doc/xhtml/DTD" "${pkgdir}/usr/share/doc/xhtml/1.0/DTD"
  ln -s "/usr/share/doc/xhtml/DTD" "${pkgdir}/usr/share/doc/xhtml/1.1/DTD"
  ln -s "/usr/share/doc/xhtml/SCHEMA" "${pkgdir}/usr/share/doc/xhtml/1.1/SCHEMA"
}
