# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-jdk"
pkgver=R2025b
pkgrel=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/openjdk.html"
license=(
  'custom:None'
)

declare -Ag _jdks=(
  [8]='R2020a R2020b R2021a R2021b R2022a R2022b R2023a R2023b R2024a R2024b R2025a R2025b'
  [11]='R2023a R2023b R2024a R2024b R2025a R2025b'
  [17]='R2024a R2024b R2025a R2025b'
  [21]='R2025a R2025b' # R2024b
)


for _jdk in "${!_jdks[@]}"; do
  pkgname+=(
    "${pkgbase}${_jdk}"
  )

  _releases=()
  for _release in ${_jdks[${_jdk}]}; do
    _releases+=(
      "matlab-${_release,,}-jdk"
    )
  done

  eval "
package_${pkgbase}${_jdk}() {
  pkgdesc+=' (JDK${_jdk} runtime dependency (system-wide))'
  depends=(
    'java-environment=${_jdk}'
  )
  provides=(
    ${_releases[@]}
  )
}"
done
