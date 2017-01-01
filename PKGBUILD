# Maintainer : Ste74 <capitani74atgmaildotcom>
# Maintainer : lemovice <lemovice-at-ancestris-dot-org> 

pkgname=ancestris
pkgver=0.9
pkgrel=1
_date=20161221
pkgdesc='Ancestris is a genealogy program written in Java'
arch=('any')
url='http://ancestris.org/'
license=('CDDL' 'GPL')

depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
#options=('!strip')
source=("$url/mw/mw-base/compteur_dl.php?/dl/pub/$pkgname/releases/${pkgname}_${pkgver}-0-${_date}.zip"
'ancestris.desktop'
'ancestris.png')

md5sums=('b0e31a340bebb676f6f6679a055c1185'
         '2d23096eea04659d55dc6d45fb57cc37'
         'bae346ed409e57d174386cd7db583ff5')
DLAGENTS=('ftp::/usr/bin/curl -fC - --ftp-pasv --retry 3 --retry-delay 3 -o %o %u'
          'http::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u'
          'https::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u'
          'rsync::/usr/bin/rsync --no-motd -z %u %o'
          'scp::/usr/bin/scp -C %u %o')


build() {
  # cleanup OS specific files
  rm $(find -name '*\.exe' -or -name '*\.bat')
#  rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*')
#  rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')
  # Remove 64 bits files on an i686 system else stripping fails
  if [ `uname -m` = 'i686' ]; then
  	rm -rf $(find -name '*64*')
	rm -rf $(find -name '*x64*')
	rm -rf $(find -name 'Linux-x86_64')
  fi
  if [ `uname -m` = 'x86_64' ]; then
  	rm -rf $(find -name '*86*')
  fi
}

package() {
  install -d ${pkgdir}/usr/share/java
  cp -r ${pkgname} ${pkgdir}/usr/share/java

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -d ${pkgdir}/usr/share/applications
  install -m644 /$srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications
  
  install -d ${pkgdir}/usr/share/pixmaps
  install -m644 $srcdir/${pkgname}.png ${pkgdir}/usr/share/pixmaps
}

# vim:set ts=2 sw=2 et:
