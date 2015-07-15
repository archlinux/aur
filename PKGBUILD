# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>
pkgname=rhythmbox-lastfm_extension-git
pkgver=20130303
pkgrel=1
pkgdesc="A Rhythmbox plugin that adds a bunch of new exciting features making of use of the great services provided by LastFM"
url="https://github.com/asermax/lastfm_extension"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox' 'python2-pylast' 'python2-pylastfp')

_plugin=lastfm_extension
_gitroot="git://github.com/asermax/lastfm_extension.git"
_gitname="rhythmbox-$_plugin"

build () {
  cd ${srcdir}
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "GIT checkout done."
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}"
  mkdir -p "${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}"

  cp lastfm_extension.plugin ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp lastfm_extension.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp LastFMExtensionGenreGuesser.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp LastFMExtensionKeys.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp LastFMExtensionUtils.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp LastFMExtensionGui.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}
  cp pylast.py ${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}

  cp -r extensions ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
  cp -r img ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
  cp genres.txt ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
  cp matcher.py ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
  cp lastfmExtensionConfigDialog.glade ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
  cp lastfmExtensionFingerprintDialog.glade ${pkgdir}/usr/share/rhythmbox/plugins/${_plugin}
}
