pkgname=dpluzz
pkgver=1.7.10
pkgrel=2
pkgdesc="Software to retrieve videos from French website pluzz"
arch=('any')
url="http://forum.ubuntu-fr.org/viewtopic.php?id=1559861&p=1"
license=('GPL')
groups=()
depends=('python2' 'pygtk' 'vte-legacy' 'mplayer' 'python2-beautifulsoup4' 'uni2ascii' 'ffmpeg' 'python2-lxml' 'python2-unidecode' 'python2-requests' 'perl-html-parser' 'wmctrl' 'perl-text-unidecode')
optdepends=()
conflicts=()
source=("https://launchpad.net/~yoggic/+archive/dpluzz/+files/dpluzz_$pkgver%7Eubuntu18.04_amd64.deb"
dPluzz-cli.sh)
sha256sums=('66b650bc6c35ab4bd609b6b8c6fcc5a2a2cb1925163606ddad5a92ec4bafa82d'
            '906485b313ed8649df3fae4d4454ed2692b6683fa5b36e849f2b66b8d389356e')


build(){
   cd "${srcdir}"
   tar xvfJ data.tar.xz

   cd ${srcdir}/usr/share/dPluzz
   sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' dPluzz.py
   cd ${srcdir}/usr/share/applications
   sed -i 's|Exec=python /usr/share/dPluzz/dPluzz.py|Exec=python2 /usr/bin/dpluzz|' dpluzz.desktop

# Fixing dpluzz script
   
   rm -f ${srcdir}/usr/share/dPluzz/dPluzz-cli.sh
   cp ${srcdir}/dPluzz-cli.sh ${srcdir}/usr/share/dPluzz/dPluzz-cli.sh
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
