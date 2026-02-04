# Maintainer: zitro <94910351+0zitro@users.noreply.github.com>
# Contributor: Michael(Pineman13) <Pineman13@openaliasbox.org>

_pkgname='dmitry'
pkgname="${_pkgname}-git"
_release_version_label='1.3a'
pkgver=1.3a.r33.g1cdadb9
pkgrel=1

pkgdesc="Simple utility to perform host audition and extended whois queries using Google and ICANN (git version)"
arch=('i686' 'x86_64')
url='http://mor-pah.net/software/dmitry-deepmagic-information-gathering-tool/'
license=('GPL')
depends=('glibc')

_github_username='0zitro'
_git_branch="feat/${_github_username}/renovate"
source=("git+https://github.com/${_github_username}/${_pkgname}#branch=${_git_branch}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}";

  # Create an annotated tag at the first commit, which (I believe) corresponds to the latest release (1.3a)
  GIT_COMMITTER_NAME=makepkg GIT_COMMITTER_EMAIL=makepkg@localmachine.localhost \
    git tag --no-sign --force -am "${_release_version_label}" "${_release_version_label}" 'df1258d2f4176bd56656577db6b7b16db4678775' \
    >/dev/null 2>&1;

  git describe --long --tags | sed -re 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g';
}

build() {
  cd "${srcdir}/${_pkgname}";

  ./configure --prefix=/usr;
  make;
}

package() {
  cd "${srcdir}/${_pkgname}";

  make DESTDIR="${pkgdir}" install;
}
