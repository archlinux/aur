# Maintainer: fuero <fuerob@gmail.com>
# based on the bugwarrior package by Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
_pkgname="bugwarrior"
_branch="develop"
# renovate: pkgName=https://github.com/ralphbean/bugwarrior depName=bugwarrior-git
_commit=dd96577c77949c8f07852785a8c8def368391970
pkgname="${_pkgname}-git"
pkgver=1585.d166c3f
pkgrel=1
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
url="https://bugwarrior.readthedocs.io"
license=('GPL3')
makedepends=(python-build python-installer python-wheel 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')

depends=('python' 
         'python-requests' 'python-taskw>=0.8'
         'python-dateutil' 'python-pytz'
         'python-pydantic' 'python-tomli'
         'python-six>=1.9.0' 'python-jinja>=2.7.2'
         'python-dogpile.cache>=0.5.3' 'python-lockfile>=0.9.1'
         'python-click')
optdepends=('python-keyring: keyring support'
            'python-jira>=3.10: jira support'
            'python-pysimplesoap: bts support'
            'python-debianbts>=2.6.1: bts support'
            'python-offtrac: Trac support'
            'python-google-api-python-client: gmail support'
            'python-oauth2client<4.0.0: gmail support'
            'python-phabricator: phabricator support'
            'python-bugzilla: bugzilla support')
conflicts=( $_pkgname )
provides=( $_pkgname )

source=("$_pkgname::git+https://github.com/GothenburgBitFactory/$_pkgname.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count $_branch).$(git rev-parse --short $_branch)
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname"
  # For pytest
  #pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
