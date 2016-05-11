# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=teeworlds-ddnet-maps-git
pkgver=r492.a1e8560
pkgrel=1
pkgdesc="All released maps with server configs of DDraceNetwork"
arch=(any)
url="https://ddnet.tw"
license=('custom')
makedepends=(git)
backup=('usr/share/teeworlds/data/autoexec_server.cfg'
        'usr/share/teeworlds/data/reset.cfg'
        'usr/share/teeworlds/data/storage.cfg')
source=("git+https://github.com/ddnet/ddnet-maps.git")
md5sums=(SKIP)

pkgver() {
  cd ddnet-maps
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ddnet-maps
  
  install -d -m755 "$pkgdir"/usr/share/teeworlds/data/types/
  
  install -m644 autoexec_server.cfg "$pkgdir"/usr/share/teeworlds/data/
  install -m644 reset.cfg           "$pkgdir"/usr/share/teeworlds/data/
  install -m644 storage.cfg         "$pkgdir"/usr/share/teeworlds/data/
  
  sed -i "$pkgdir"/usr/share/teeworlds/data/autoexec_server.cfg \
      -e '/sv_test_cmds/s/1/0/'
  
    # Add a '#' in the begining of the line to NOT install unwanted map types
  cp -a types/novice "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/moderate "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/brutal "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/dummy "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/ddmax "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/oldschool "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/solo "$pkgdir"/usr/share/teeworlds/data/types/
  cp -a types/race "$pkgdir"/usr/share/teeworlds/data/types/
}
