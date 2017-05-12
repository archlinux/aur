# Maintainer: De Wet van Niekerk <dewet.vanniekerk@safe.com>

# Please note that while I am an employee of Safe Software, this PKGBUILD is
# entirely unsupported, and I provide it as myself, and not as a representative
# of Safe Software.

# THE PKGBUILD IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE PKGBUILD OR THE USE OR OTHER DEALINGS IN THE
# PKGBUILD.
#
# The software itself is distributed under the terms of the Safe Software EULA,
# which is included in the built package, and can also be accessed at
# https://cdn.safe.com/resources/fme/SLA-FME.pdf

pkgname=fme-desktop-2017
pkgver=2017.0.1.0.17288
pkgrel=1
_orig_distro=ubuntu.16.04
pkgdesc="An ETL tool with support for location data"
arch=('x86_64')
url="http://safe.com"
license=('custom:"Copyright (c) 2017 Safe Software Inc."')

# Source of dependency from Ubuntu package listed as comment
depends=(
  'glibc>=2.17'               # libc6 (>= 2.17)
  'expat>=2.0.1'              # libexpat1 (>= 2.0.1)
  'freetype2>=2.2.1'          # libfreetype6 (>= 2.2.1)
  'gcc-libs>=4.2'             # libgcc1 (>= 1:4.2), libstdc++6 (>= 4.8.1)
  'mesa'                      # libgl1-mesa-glx | libgl1
  'glib2>=2.16.0'             # libglib2.0-0 (>= 2.16.0)
  'gmp'                       # libgmp10
  'libtool>=2.4.6'            # libltdl7 (>= 2.4.6)
  'mpfr>=3.1.3'               # libmpfr4 (>= 3.1.3)
  'unixodbc>=2.3.1'           # libodbc1 (>= 2.3.1)
  'libpng12>=1.2.13'          # libpng12-0 (>= 1.2.13-4)
  'python2>=2.7'              # libpython2.7 (>= 2.7)
  'python>=3.5'               # libpython3.5 (>= 3.5.0~b1)
  'qt5-base>=5.5.1'           # libqt5core5a (>= 5.5.1),
                              # libqt5gui5 (>= 5.5.0) | libqt5gui5-gles (>= 5.5.0),
                              # libqt5network5 (>= 5.0.2), libqt5opengl5 (>= 5.0.2),
                              # libqt5printsupport5 (>= 5.0.2), libqt5sql5 (>= 5.0.2),
                              # libqt5widgets5 (>= 5.4.0), libqt5xml5 (>= 5.2.0)
  'qt5-svg>=5.0.2'            # libqt5svg5 (>= 5.0.2)
  'qt5-webkit>=5.2.0'         # libqt5webkit5 (>= 5.2.0)
  'qt5-xmlpatterns'           # libqt5xmlpatterns5 (>= 5.0.2)
  'sqlite>=3.7.15'            # libsqlite3-0 (>= 3.7.15)
  'libssh2>=1.2.8'            # libssh2-1 (>= 1.2.8)
  'libutil-linux>=2.16'       # libuuid1 (>= 2.16)
  'libx11'                    # libx11-6
  'libxml2>=2.7.4'            # libxml2 (>= 2.7.4)
  'zlib>1:1.2.0'              # zlib1g (>= 1:1.2.0)
  'python-matplotlib>=1.2.0'  # python3-matplotlib (>= 1.2.0)
  'python2-matplotlib>=1.2.0' # python-matplotlib (>= 1.2.0)
  'python-numpy>=1.8.0'       # python3-numpy (>= 1.8.0)
  'python2-numpy>=1.8.0'      # python-numpy (>= 1.8.0)
  'java-runtime-headless=7'   # default-jre-headless (>= 2:1.7)
  'lsb-release>=1.4-1'        # lsb-core (>= 4.1)
  'graphviz>=2.30'            # graphviz (>= 2.30)
)

provides=('fme-desktop')
options=('!strip' '!upx')
source=(
  "https://downloads.safe.com/fme/2017/${pkgname}_${pkgver}~${_orig_distro}_amd64.deb"
)
sha256sums=(
  'e92f215815e9349bb40609a5b278241c0f2e7601973aa209f6d388a1bed32536'
)

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D -m644 "${pkgdir}/opt/fme-desktop-2017/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/lib/jvm"
  ln -s "/usr/lib/jvm/default" "${pkgdir}/usr/lib/jvm/default-java"
}
