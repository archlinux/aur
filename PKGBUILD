# Maintainer: James An <james@jamesan.ca>

pkgbase='deluge-plugins'
pkgname=(deluge-movetools
         deluge-labelplus
         deluge-smartmove
         deluge-stats
         deluge-webapi)
pkgver=1
pkgrel=1
pkgdesc="Various Deluge plugins"
arch=('any')
url='http://dev.deluge-torrent.org/wiki/Plugins#Plugins3rdParty'
license=('GPL3')
depends=('deluge')
source=("https://github.com/ratanakvlun/deluge-movetools/releases/download/v0.2.0.2/MoveTools-0.2.0.2-py2.7.egg"
        "https://github.com/ratanakvlun/deluge-labelplus/releases/download/v0.3.2.2/LabelPlus-0.3.2.2-py2.7.egg"
        "https://github.com/downloads/megaumi/smart-move/SmartMove-0.1-py2.7.egg"
        "https://github.com/downloads/ianmartin/Deluge-stats-plugin/Stats-0.3.2-py2.7.egg"
        "https://pypi.python.org/packages/2.7/d/deluge-webapi/deluge_webapi-0.1.0-py2.7.egg")
md5sums=('344a8aa43a721181c7da8d768405d727'
         'b77620bc9ada8c09314414fdeb4fe8d4'
         'c0d1de728c46e03ddaa6bf779a036534'
         '6461ab8036c681f15b2eb7dc48d3dbe2'
         '7969b188607228c322676c1c564259f5')

package_deluge-plugin() {
  file_suffix=py2.7.egg
  declare -A _pkgname=(
    [deluge-movetools]=MoveTools
    [deluge-labelplus]=LabelPlus
    [deluge-smartmove]=SmartMove
    [deluge-stats]=Stats
    [deluge-webapi]=deluge_webapi
  )
  declare -A _pkgver=(
    [deluge-movetools]=0.2.0.2
    [deluge-labelplus]=0.3.2.2
    [deluge-smartmove]=0.1
    [deluge-stats]=0.3.2
    [deluge-webapi]=0.1.0
  )
  declare -A _pkgdesc=(
    [deluge-movetools]='Plugin for Deluge that shows the move status of a torrent.'
    [deluge-labelplus]='Plugin for Deluge that can be used to organize torrents by assigning labels.'
    [deluge-smartmove]="Plugin for Deluge that improves its 'move storage' functionality."
    [deluge-stats]='Plugin for Deluge that displays pretty graphs much like the utorrent speed tab.'
    [deluge-webapi]='Plugin for Deluge WebUI providing sane JSON API.'
  )
  declare -A _url=(
    [deluge-movetools]='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=42623'
    [deluge-labelplus]='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=42629'
    [deluge-smartmove]='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=40835'
    [deluge-stats]='http://dev.deluge-torrent.org/wiki/Plugins/Stats'
    [deluge-webapi]='https://pypi.python.org/pypi/deluge-webapi'
  )
  declare -A _depends=(
    [deluge-movetools]='gtk2'
    [deluge-labelplus]='gtk2'
    [deluge-smartmove]='gtk2'
    [deluge-stats]='gtk2'
    [deluge-webapi]=''
  )
  declare -A _license=(
    [deluge-movetools]=MoveTools
    [deluge-labelplus]=LabelPlus
    [deluge-smartmove]=SmartMove
    [deluge-stats]=Stats
    [deluge-webapi]=webapi
  )

  pkgname=$1
  _pkgname="${_pkgname[$pkgname]}"
  pkgver="${_pkgver[$pkgname]}"
  pkgdesc="${_pkgdesc[$pkgname]}"
  url="${_url[$pkgname]}"
  read -a depends <<< "${depends[*]} ${_depends[$pkgname]}"
  license="${_license[$pkgname]}"

  install -Dm644 "$_pkgname-$pkgver-$file_suffix" "$pkgdir/usr/lib/python2.7/site-packages/deluge/plugins/$_pkgname-$pkgver-$file_suffix"
}

# Instantiate packaging function using the system
for funcname in "${pkgname[@]}"; do
  eval "package_$funcname() {
    package_deluge-plugin $funcname
  }"
done
