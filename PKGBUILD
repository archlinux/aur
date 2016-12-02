# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=cnijfilter-common-mg2500
pkgver=4.00
pkgrel=1
pkgdesc="Canon IJ Printer Driver (common package)"
arch=('i686' 'x86_64')
url="http://support-ph.canon-asia.com/contents/PH/EN/0100466201.html"
license=('unknown')
depends=('cups' 'popt' 'libxml2' 'gtk2' 'libtiff' 'libpng')
source=("http://gdlp01.c-wss.com/gds/1/0100005501/01/cnijfilter-mg2500series-$pkgver-$pkgrel-rpm.tar.gz")
md5sums=('37fd638ae176fad74fd656f6cb719ead')

build() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-common-$pkgver*${CARCH}*.rpm")
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-common-$pkgver*i386*.rpm")
  fi

  bsdtar -xf $rpmfile

  mv usr/local/share/locale/ja/LC_MESSAGES/cnijlgmon2.mo usr/local/share/locale/ja/LC_MESSAGES/cnijlgmon2_ja.mo
  mv usr/local/share/locale/zh/LC_MESSAGES/cnijlgmon2.mo usr/local/share/locale/zh/LC_MESSAGES/cnijlgmon2_zh.mo
  mv usr/local/share/locale/fr/LC_MESSAGES/cnijlgmon2.mo usr/local/share/locale/fr/LC_MESSAGES/cnijlgmon2_fr.mo
  mv usr/local/share/locale/de/LC_MESSAGES/cnijlgmon2.mo usr/local/share/locale/de/LC_MESSAGES/cnijlgmon2_de.mo

  find . -type f -exec mv --backup=numbered -t . {} +

}

package() {
  cd ${srcdir} 

	install -Dm644 81-canonij_prn.rules "${pkgdir}/etc/udev/rules.d/81-canonij_prn.rules"

	install -Dm644 cnb_cnijlgmon2.res "${pkgdir}/usr/share/cnijlgmon2_mg2500/cnb_cnijlgmon2.res"
	install -Dm644 nozzlecheck.utl "${pkgdir}/usr/share/cmdtocanonij_mg2500/nozzlecheck.utl"
	install -Dm644 cleaning.utl "${pkgdir}/usr/share/cmdtocanonij_mg2500/cleaning.utl"
	install -Dm644 autoalign.utl "${pkgdir}/usr/share/cmdtocanonij_mg2500/autoalign.utl"

	install -Dm644 cnijlgmon2 "${pkgdir}/usr/bin/cnijlgmon2"
	install -Dm644 cnijnetprn "${pkgdir}/usr/bin/cnijnetprn"
	install -Dm644 cngpij "${pkgdir}/usr/bin/cngpij"
	install -Dm644 cnijnpr "${pkgdir}/usr/bin/cnijnpr"
	install -Dm644 cngpijmnt "${pkgdir}/usr/bin/cngpijmnt"

	install -Dm644 cmdtocanonij "${pkgdir}/usr/lib/cups/filter/cmdtocanonij"
	install -Dm644 pstocanonij "${pkgdir}/usr/lib/cups/filter/pstocanonij"
	install -Dm644 cnijnet "${pkgdir}/usr/lib/cups/backend/cnijnet"
	install -Dm644 cnijbe "${pkgdir}/usr/lib/cups/backend/cnijbe"
	install -Dm644 cnijusb "${pkgdir}/usr/lib/cups/backend/cnijusb"
	install -Dm644 libcnbpcnclapicom.so.4.0.0 "${pkgdir}/usr/lib/libcnbpcnclapicom.so.4.0.0"
	install -Dm644 libcnnet.so.1.2.2 "${pkgdir}/usr/lib/libcnnet.so.1.2.2"
	install -Dm644 cnnet.ini "${pkgdir}/usr/lib/bjlib/cnnet.ini"

	install -Dm644 LICENSE-cnijfilter-4.00FR.txt "${pkgdir}/usr/share/doc/cnijfilter-common-4.00/LICENSE-cnijfilter-4.00FR.txt"
	install -Dm644 LICENSE-cnijfilter-4.00SC.txt "${pkgdir}/usr/share/doc/cnijfilter-common-4.00/LICENSE-cnijfilter-4.00SC.txt"
	install -Dm644 LICENSE-cnijfilter-4.00EN.txt "${pkgdir}/usr/share/doc/cnijfilter-common-4.00/LICENSE-cnijfilter-4.00EN.txt"
	install -Dm644 LICENSE-cnijfilter-4.00JP.txt "${pkgdir}/usr/share/doc/cnijfilter-common-4.00/LICENSE-cnijfilter-4.00JP.txt"

	install -Dm644 cnijlgmon2_ja.mo "${pkgdir}/usr/share/locale/ja/LC_MESSAGES/cnijlgmon2.mo"
	install -Dm644 cnijlgmon2_fr.mo "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/cnijlgmon2.mo"
	install -Dm644 cnijlgmon2_zh.mo "${pkgdir}/usr/share/locale/zh/LC_MESSAGES/cnijlgmon2.mo"
	install -Dm644 cnijlgmon2_de.mo "${pkgdir}/usr/share/locale/de/LC_MESSAGES/cnijlgmon2.mo"

}
