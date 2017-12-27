pkgname=dpluzz
pkgver=1.7.4
pkgrel=1
pkgdesc="Software to retrieve videos from French website pluzz"
arch=('any')
url="http://forum.ubuntu-fr.org/viewtopic.php?id=1559861&p=1"
license=('GPL')
groups=()
depends=('python2' 'pygtk' 'vte' 'mplayer' 'python2-beautifulsoup4' 'uni2ascii' 'ffmpeg' 'python2-lxml' 'python2-unidecode' 'python2-requests' 'perl-html-parser' 'wmctrl' 'perl-text-unidecode')
optdepends=()
conflicts=()
source=("https://launchpad.net/~yoggic/+archive/dpluzz/+files/dpluzz_$pkgver%7Eubuntu17.10_amd64.deb")
sha256sums=('f9f829fbfc0b6d7e4806a93bf6f188a21d122bde52bc0c3827bfa6853f7bca2a')

build(){
   cd "${srcdir}"
   tar xvfJ data.tar.xz

   cd ${srcdir}/usr/share/dPluzz
   sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' dPluzz.py
   cd ${srcdir}/usr/share/applications
   sed -i 's|Exec=python /usr/share/dPluzz/dPluzz.py|Exec=python2 /usr/bin/dpluzz|' dpluzz.desktop

   chmod 755 ${srcdir}/usr/share/dPluzz/dPluzz-cli.sh
   sed -i 's|#! /usr/bin/env python|#!/usr/bin/env python2|' ${srcdir}/usr/bin/dpluzz
}

package(){
   cd "${srcdir}"
   mv usr/ ${pkgdir}/

# Work around "ubuntu-ism" ie avconv

   mkdir -p ${pkgdir}/usr/local/bin
   ln -sf /usr/bin/ffmpeg ${pkgdir}/usr/local/bin/avconv
}

