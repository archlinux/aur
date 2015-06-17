# Maintainer: M0Rf30
# Contributor: Eschwartz <eschwartz93@gmail.com>

pkgname=winetricks-git
pkgver=20150416.r3.g568fed6
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='http://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('any')
depends=('wine' 'cabextract' 'unzip' 'xorg-xmessage' 'wget')
makedepends=('git')
optdepends=('zenity: GUI for GNOME desktop'
            'kdebase-kdialog: GUI for KDE desktop')
conflicts=('winetricks' 'bin32-winetricks')
replaces=('bin32-winetricks' 'winetricks')
provides=('winetricks')
source=("https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"
        "https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks.1")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    awk 'BEGIN {
           FS = "[ /^]+"
           while ("git ls-remote https://github.com/Winetricks/winetricks | sort -Vk2" | getline) {
               if (!sha)
                   sha = substr($0, 1, 7)
               tag = $3
           }
           while ("curl -s https://github.com/Winetricks/winetricks/releases/tag/" tag | getline)
               if ($3 ~ "commits")
                   com = $2
           printf com ? "%s.r%s.g%s\n" : "%s\n", tag, com, sha
       }'
}

package() {
  install -Dm755 ${srcdir}/winetricks ${pkgdir}/usr/bin/winetricks
  install -Dm755 ${srcdir}/winetricks.1 ${pkgdir}/usr/share/man/man1/winetricks.1
}
