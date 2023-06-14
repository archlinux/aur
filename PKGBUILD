# Maintainer: Daniel Lundin <dln@arity.se>

pkgname=gnome-ssh-askpass4-git
_pkgbase=openssh-portable
_git_commit=8023317e22368c32a6391ab8febf13067f669704 # https://github.com/openssh/openssh-portable/pull/400
pkgver=9.3p1.pr400.${_git_commit:0:7}
pkgrel=1
pkgdesc='A  passphrase requester for ssh-add using gcr.'
arch=('x86_64')
url="https://www.openssh.com/portable.html"
license=('custom:2-term BSD licence')
depends=('gcr-4')
provides=('x11-ssh-askpass')
conflicts=('gnome-ssh-askpass' 'gnome-ssh-askpass2' 'gnome-ssh-askpass3')

source=(https://github.com/openssh/openssh-portable/archive/${_git_commit}.tar.gz
        gnome-ssh-askpass4.sh)
sha256sums=('c9412ec80d651b3998da1de594dd223b8bcab3205b241393238a95aca01d4de8'
            '89309c0cc5c58bba32d03c1d998175f01b1f471589b4400dfe5d01702837c828')

build() {
  cd "${_pkgbase}-${_git_commit}/contrib"
  make gnome-ssh-askpass4
}

package() {
  cd "${_pkgbase}-${_git_commit}/contrib"

  install -D -m 755 gnome-ssh-askpass4 "${pkgdir}/usr/lib/ssh/gnome-ssh-askpass4"
  install -D -m 755 "${srcdir}/gnome-ssh-askpass4.sh" "${pkgdir}/etc/profile.d/gnome-ssh-askpass4.sh"
  install -D -m 644 ../LICENCE "${pkgdir}/usr/share/licenses/gnome-ssh-askpass4/LICENCE"
}
