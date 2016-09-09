pkgname=dpluzz
pkgver=1.6.3
pkgrel=1
pkgdesc="Software to retrieve videos from French website pluzz"
arch=('any')
url="http://forum.ubuntu-fr.org/viewtopic.php?id=1559861&p=1"
license=('GPL')
groups=()
depends=('python2' 'pygtk' 'vte' 'mplayer' 'python2-beautifulsoup3' 'python2-beautifulsoup4' 'uni2ascii' 'ffmpeg' 'python2-lxml')
optdepends=()
conflicts=()
source=("https://launchpad.net/~yoggic/+archive/dpluzz/+files/dpluzz_$pkgver%7Eubuntu16.04_amd64.deb")
sha1sums=('4bd3fa242b18339c0c9d92fef4f52880e7667299')

build(){
   cd "${srcdir}"
   tar xvfJ data.tar.xz
   cd ${srcdir}/usr/share/dPluzz
   sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' dPluzz.py
   cd ${srcdir}/usr/share/applications
   sed -i 's|Exec=python /usr/share/dPluzz/dPluzz.py|Exec=python2 /usr/bin/dpluzz|' dpluzz.desktop
}

package(){
   cd "${srcdir}"
   mv usr/ ${pkgdir}/

# Work around "ubuntu-ism" ie avconv

   mkdir -p ${pkgdir}/usr/local/bin
   ln -sf /usr/bin/ffmpeg ${pkgdir}/usr/local/bin/avconv
}


