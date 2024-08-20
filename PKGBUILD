# Maintainer: Giovanni Santini <itachi.sama.amaterasu@gmail.com>
# Contributor: Dustin Falgout <dustin@antergos.com>

pkgname=obs-service-tar_scm-git
pkgver=0.10.48.r835
pkgrel=1
pkgdesc="Source Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-tar_scm"
license=('GPL3')
source=("${pkgname}::git+${url}.git")
groups=('obs')
depends=('python'
         'obs-build'
         'git'
         'python-yaml'
         'python-dateutil')
checkdepends=('flake8'
              'python-mock'
              'python-pylint'
              'bzr'
              'cpio'
              'mercurial'
              'subversion')
optdepends=('cpio: needed for running properly the obs_scm source service'
            'subversion: svn repo support.'
            'mercurial: hg repo support.'
            'bzr: bzr repo support.')
backup=("etc/obs/services/tar_scm")
sha256sums=('SKIP')
# Comment this line to run tests
BUILDENV+=('!check')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)"
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
