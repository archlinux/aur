# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

_base=dolfin
pkgname=python-${_base}
pkgdesc="The Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations (stable)."
pkgver=2018.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-dolfin-git')
depends=('dolfin=2018.1.0'
				 'python-pkgconfig'
				 'python-ply')
optdepends=('python-mpi4py: MPI library for python'
            'petsc4py: interface with PETSc from python'
            'slepc4py: interface with SLEPc from python'
            'python-matplotlib: plotting support')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('5d1836df4dcc1d55f63ecc20635305a6d5b39cbfc63584b43ec2568452dc5e71')

export MAKEFLAGS="-j1"

build() {
  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
  [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	cd ${srcdir}/${_base}-${pkgver}/python
  python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}/python
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
