# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=clamtk
pkgver=5.20
pkgrel=1
pkgdesc="GUI front-end for ClamAV using Perl and Gtk libraries. It is designed to be an easy-to-use, on-demand scanner for Linux systems"
url="http://code.google.com/p/clamtk/"
arch=('any')
license=('GPL')
depends=('clamav' 'perl' 'gtk2-perl' 'perl-locale-gettext' 'perl-libwww' 'perl-http-message' 'perl-lwp-protocol-https' 'perl-text-csv' 'perl-json' 'python' 'zenity' 'desktop-file-utils' 'gnome-icon-theme')
install=clamtk.install
source=(https://bitbucket.org/dave_theunsub/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha512sums=('fb6a09c16c622f3161bcc9384f4cc9fa7bdf0609c44e19afcbec980d5636670a7e1adb232bac980100d9ed50e2b668aa71633a035a6faa5b113157d09c4f11bb')

package() {
  cd ${pkgname}-${pkgver}

  # executable
  install -Dm 755 clamtk "${pkgdir}/usr/bin/clamtk"
  
  # libs
  for n in lib/* ; do
	  install -Dm 644 $n "${pkgdir}/usr/lib/perl5/vendor_perl/ClamTk/`basename $n`"
  done
  
  # localization
  for n in po/*.mo ; do
	  install -Dm 644 $n "${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/clamtk.mo"
  done
  
  # man pages
  install -Dm 644 clamtk.1.gz "${pkgdir}/usr/share/man/man1/clamtk.1.gz"
  
  # doc
  install -Dm 644 CHANGES "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
  install -Dm 644 DISCLAIMER "${pkgdir}/usr/share/doc/${pkgname}/DISCLAIMER"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  
  # help
  install -d "${pkgdir}/usr/share/help/"
  cp -dr --no-preserve=ownership help/* "${pkgdir}/usr/share/help/"
  
  # pixmaps
  install -Dm 644 images/clamtk.xpm "${pkgdir}/usr/share/pixmaps/clamtk.xpm"
  install -Dm 644 images/clamtk.png "${pkgdir}/usr/share/pixmaps/clamtk.png"
  
  # menu
  install -Dm 644  clamtk.desktop "${pkgdir}/usr/share/applications/clamtk.desktop"
  
  # nautilus
  # install -Dm 755  clamtk.py "${pkgdir}/usr/share/nautilus-python/extensions/clamtk.py"
}

# vim: ts=2 sw=2 et:
