# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=texlive-full
pkgver=$(date "+%Y%m%d")
_year=$(date "+%Y")
pkgrel=1
pkgdesc="This packages provides texlive-full in /opt.  It also tricks ArchLinux into thinking it has its texlive packages installed."
url="http://www.tug.org/texlive/"
arch=("x86_64")
license=("GPL")
makedepends=("wget" "xz")
provides=('texlive-bin' $(pacman -Sgq texlive-most texlive-lang))
conflicts=('texlive-bin' $(pacman -Sgq texlive-most texlive-lang))
source=("http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz")
sha256sums=('SKIP')
install=${pkgname}.install
#PKGEXT='.pkg.tar'

package() {
  # creating a profile for unattened installation
  echo "selected_scheme scheme-full" > "${srcdir}/texlive.profile"
  echo "TEXDIR ${pkgdir}/opt/texlive/${_year}" >> "${srcdir}/texlive.profile"
  echo "TEXMFLOCAL ${pkgdir}/opt/texlive/texmf-local" >> "${srcdir}/texlive.profile"
  echo "TEXMFSYSCONFIG ${pkgdir}/opt/texlive/${_year}/texmf-config" >> "${srcdir}/texlive.profile"
  echo "TEXMFSYSVAR ${pkgdir}/opt/texlive/${_year}/texmf-var" >> "${srcdir}/texlive.profile"
  echo "TEXMFHOME ~/.texmf" >> "${srcdir}/texlive.profile"

  # start the installer and install
  "${srcdir}/install-tl-${pkgver}/install-tl" -profile "${srcdir}/texlive.profile"
  # remove profile file and installation log
  rm -vf "${pkgdir}/opt/texlive/${_year}/tlpkg/texlive.profile"
  rm -vf "${pkgdir}/opt/texlive/${_year}/install-tl.log"
}
# vim:set ts=2 sw=2 et:

