# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marcos M. Raimundo <marcosmrai@gmail.com>
# Contributor: Patrick Klein <patrick@libklein.com>

# https://www.gurobi.com/downloads/gurobi-software/
# https://docs.gurobi.com/projects/optimizer/en/current/reference/releasenotes/platforms.html

_name="gurobi"
pkgname="matlab-${_name}"
pkgver=12.0.3
pkgrel=2
pkgdesc="State-of-the-art solver for mathematical programming (MATLAB bindings)"
arch=('x86_64') # 'aarch64'
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
depends=("${_name}>=${pkgver}" 'matlab-release>=R2019a')
_pkgsrc="${_name}-${pkgver}"
source=("${_name}_setup.m")
# source_aarch64=("${_pkgsrc}-aarch64.tar.gz::https://packages.gurobi.com/${pkgver%.*}/${_name}${pkgver}_armlinux64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://packages.gurobi.com/${pkgver%.*}/${_name}${pkgver}_linux64.tar.gz")
md5sums=('fde2cef01f075e2d28188576a2639b34')
md5sums_x86_64=('7cb948ba0906faf0d666b77a40687cc2')
b2sums=('5e704dc5b6ede40064772fea3fadcfb4728e8d402829162045364aae21f25aa59bea4e3ddb666050ef3351daae73f5b3f7f9c5d06c08fb8f2fc68d521a07570d')
b2sums_x86_64=('5dd5419d105e273da774423880b59f7dd13b6ee6136acd4710ef59357bb95faa8811b4f9d1b7ec616995241e483083d6f50d9482a805e9c7b1c894642004cf6e')

if   [ "$CARCH" = 'aarch64' ]; then _arch=armlinux64;
elif [ "$CARCH" = 'x86_64'  ]; then _arch=linux64; fi

prepare() {
  cd "${srcdir}/${_name}${pkgver//./}/${_arch}"
  cp "${srcdir}/${_name}_setup.m" matlab/
}

package_matlab-gurobi() {
  cd "${srcdir}/${_name}${pkgver//./}/${_arch}"
  # is this the right path?
  # do '*.mexa64' files need 755 permissions?
  find "matlab" -type f \( -name '*.m' -o -name '*.mexa64' \) -exec \
    install -vDm644 "{}" "${pkgdir}/usr/lib/${_name}/{}" \;

  cd "examples"
  find "matlab" -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${_name}/examples/{}" \;
}
