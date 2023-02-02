# Maintainer: mhaquila <mhaquila ad pharosmaris dot com>
pkgname=treecomp
pkgver=20191106
pkgrel=1
pkgdesc='Interactive utility to keep 2 directory trees and the files within the directories in sync'
arch=('any')
url='https://lploeger.home.xs4all.nl/TreeComp.htm'
license=('custom: Free to use and share (see: https://lploeger.home.xs4all.nl/TreeComp3.htm#freeware)')
depends=('wine')
source=("https://lploeger.home.xs4all.nl/TreeComp${pkgver}_noinstall.zip"
        "https://lploeger.home.xs4all.nl/TreeCompIcon.gif")
noextract=("TreeComp${pkgver}_noinstall.zip")
sha256sums=('367f5c28a8c86381c07fead7e295e73db426fb33c874e8eabf3bde326c11d55b'
            '734918bc25db284cb788b81f2eab3cceee90cae2581d1941ad924cb5d8b16584')

prepare() {
  cd "$srcdir/"
  cat << 'EOF' > "$pkgname.desktop"
[Desktop Entry]
Version=$pkgver
Type=Application
Name=TreeComp
Name[en]=TreeComp
Name[fr]=TreeComp
Name[it]=TreeComp
GenericName=Directories trees comparator
GenericName[en]=Directories trees comparator
GenericName[fr]=Comparateur d'arborescences de répertoires
GenericName[it]=Comparatore di alberi di directory
Comment=$pkgdesc
Comment[en]=Interactive utility to keep 2 directory trees and the files within the directories in sync
Comment[fr]=Utilitaire interactif pour synchroniser 2 arborescences de répertoires et leurs fichiers
Comment[it]=Utilità interattiva per sincronizzare 2 alberi di directory e i loro file
Path=/opt/$pkgname
Exec=bash -c 'WINEARCH=win32 WINEPREFIX=$HOME/.config/$pkgname wine TreeComp.exe'
Icon=$pkgname
Keywords=folders;comparator;
Terminal=false
Categories=Utility;FileTools;
MimeType=inode/directory;
StartupNotify=false
Actions=help;

[Desktop Action help]
Name=TreeComp Help Topics
Name[en]=TreeComp Use Manual
Name[fr]=Guide d'utilisation de TreeComp
Name[it]=Manuale d'uso di TreeComp
Exec=bash -c 'WINEARCH=win32 WINEPREFIX=$HOME/.config/$pkgname wine TreeComp.chm'
EOF
  
  unzip -o "TreeComp${pkgver}_noinstall.zip" -d "$pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/treecomp"
  cat << 'EOF' > "$pkgdir/usr/share/licenses/treecomp/LICENSE.md"
# Use license

This licence is mentionned on the author site.
See https://lploeger.home.xs4all.nl/TreeComp3.htm#freeware

## Freeware note

If you like the program, pass it on to others! TreeComp is a closed source
(with the exception of "Part of the source" below) freeware program written
in Delphi.

## Part of the source

[Launch.pas](https://lploeger.home.xs4all.nl/Launch.htm) contains the part
of the source code of TreeComp that handles launching an application from
Delphi.
EOF

  mkdir -p "$pkgdir/opt/$pkgname" \
           "$pkgdir/usr/share/icons/hicolor/32x32/apps/" \
           "$pkgdir/usr/share/applications/"
  cp -afH "$srcdir/$pkgname/" \
          "$pkgdir/opt/"
  cp -afH "$srcdir/TreeCompIcon.gif" \
          "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  cp -afH "$srcdir/$pkgname.desktop" \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
}
