# Maintainer: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor (auto-disper-git): Byron Clark <byron@theclarkfamily.name>
pkgname=autorandr-git
pkgver=20120301
pkgrel=1
pkgdesc="Auto-detect connected display hardware and load appropriate X11 setup using xrandr or disper. Formerly auto-disper."
url="http://github.com/wertarbyte/autorandr"
arch=('any')
license=('None')
optdepends=('disper')
conflicts=('auto-disper-git')
makdepends=('git')

_gitroot="http://github.com/wertarbyte/autorandr.git"
_gitname=autorandr
         
build() {
  cd ${srcdir}
  
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
  else
    git clone ${_gitroot} ${_gitname}
  fi

  install -D -m 0755 ${srcdir}/${_gitname}/autorandr ${pkgdir}/usr/bin/autorandr
  ln -s /usr/bin/autorandr ${pkgdir}/usr/bin/auto-disper
  install -D -m 0755 ${srcdir}/${_gitname}/pm-utils/40autorandr ${pkgdir}/etc/pm/sleep.d/40autorandr
  install -D -m 0755 ${srcdir}/${_gitname}/bash_completion/autorandr ${pkgdir}/etc/bash_completion.d/autorandr
}
# vim: set ft=sh ts=2 sw=2 et:
