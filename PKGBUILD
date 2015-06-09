# Maintainer: David Fryer <dfryer1193@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Shaun Smiley <senorsmile@gmail.com>
# Contributor: Jacky Ren <rjjacky<at>gmail[dot]com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
pkgname=aerofs
pkgver=0.8.91
pkgrel=1
pkgdesc="Synchronize your files without servers and build private cloud storage out of your own devices. This package is self-updating and is only needed for initial installation."
arch=('i686' 'x86_64')
license=('custom')
depends=('java-environment>=7' 'lib32-mesa' 'glu' 'gtk2' 'libxtst' 'coreutils' 'procps-ng' 'xdg-utils' )
url="https://www.aerofs.com"
source=('https://dsy5cjk52fz4a.cloudfront.net/aerofs-installer-0.8.91.tgz'
	'aerofs.desktop'
	'aerofs.png'
	'LICENSE')
md5sums=('d26fd05382b4d3228cf623c4128d310d'
         '00356e97290137ac6e91ef6d465573e4'
         '9b6285b595cd809e2835158bdc666342'
         '2768824f98dae3379f7bc95891cdcdfe')
package() {
  _destdir="opt/aerofs"

  # Install everything to /opt
  cd "${srcdir}/aerofs"
  mkdir -p "${pkgdir}/${_destdir}"
  cp -r * "${pkgdir}/${_destdir}"
  # License 
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  # Cleanup unrequired files
  rm -f "${pkgdir}/${_destdir}/INSTALL"

  # Put the .desktop , icon, and license file in the correct location
  install -m644 -D "${srcdir}/aerofs.desktop" "${pkgdir}/usr/share/applications/aerofs.desktop"
  install -m644 -D "${srcdir}/aerofs.png" "${pkgdir}/usr/share/icons/aerofs.png"
  install -m644 -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Link binarys to /usr/bin/
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /${_destdir}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  ln -s /${_destdir}/${pkgname}-cli "${pkgdir}/usr/bin/${pkgname}-cli"

}


