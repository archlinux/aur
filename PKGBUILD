# Forked from eclipse PKGBUILD
# Contributor : Pablo Nicolas Diaz <pablonicolas.diaz@gmail.com>
# Contributor : Andrew Wright <andreww@photism.org>
# Contributor : Andreas W. Hauser <andy-aur@splashground.de>
# Mantainer : Paul Mattal <paul@archlinux.org>

pkgname=eclipse-reporting
_package=reporting
pkgver=3.6
_internal_pkgver=R
_version=helios
pkgrel=2
pkgdesc="An IDE for Java and other languages - JEE + BIRT package"
arch=('any')
url="http://eclipse.org"
depends=('java-environment>=6' 'gtk2>=2.16.1' 'unzip' 'xulrunner>=1.9.0.10')
install=eclipse.install
conflicts=('eclipse')
provides=('eclipse=3.5' 'eclipse-wtp-wst=3.1.1' 'eclipse-wtp=3.1.1' 'eclipse-dtp=1.7.2' 'eclipse-emf=2.5.0')
makedepends=('zip')
license=("EPL/1.1")
if [ "$CARCH" = "x86_64" ]; then
source=(ftp://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/${_version}/${_internal_pkgver}/eclipse-${_package}-${_version}-linux-gtk-x86_64.tar.gz
	http://svgicons.o7a.net/unofficial/eclipse.svg
            eclipse.sh
            eclipse.desktop)


md5sums=('8dd3a6c8f1fb0a9f3e57109ab8cf47cb'
         'fdc1501a2e940860c3f03e88c5ddf9d8'
         'a1666ff79a3c3d48e535d789d4a1b9ff'
         'd88490571b49c8ebb221ed349815d040')

else
source=(ftp://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/${_version}/${_internal_pkgver}/eclipse-${_package}-${_version}-${_internal_pkgver}-linux-gtk.tar.gz
	http://svgicons.o7a.net/unofficial/eclipse.svg
            eclipse.sh
            eclipse.desktop)

md5sum=('4d76e6800ea05075f24daf669b6caa2f' 
        'fdc1501a2e940860c3f03e88c5ddf9d8'
        'a1666ff79a3c3d48e535d789d4a1b9ff'
        'd88490571b49c8ebb221ed349815d040')
fi

build() {
  cd "${srcdir}/eclipse" || return 1

  # patch to increase default memory limits
  # patch -Np0 -i "${srcdir}/eclipse.ini.patch" || return 1

  # install eclipse
  install -m755 -d "${pkgdir}/usr/share"
  mv "${srcdir}/eclipse" "${pkgdir}/usr/share/" || return 1

  # install misc
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications \
    ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48}/apps || return 1
  install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse" || return 1
  install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/" || return 1

  ln -s "${pkgdir}/usr/share/eclipse/plugins/org.eclipse.*/eclipse.png" \
    "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png" || return 1
  ln -s "${pkgdir}/usr/share/eclipse/plugins/org.eclipse.*/eclipse32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png" || return 1
  ln -s "${pkgdir}/usr/share/eclipse/plugins/org.eclipse.*/eclipse48.png" \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png" || return 1

  install -D -m644 ${srcdir}/eclipse.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg || return 1
}

