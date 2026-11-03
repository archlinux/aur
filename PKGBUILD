# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# The .NET packages build against the packages of one .NET build, never a mix: they makedepend on
# dotnet-build-deps-11.0, which this package (Microsoft's build) provides. Arch Linux has no .NET 11
# yet, so there's no source-built variant of it (dotnet-build-deps-11.0) either: the packages of .NET
# itself come from nuget.org, Microsoft's build that matches the SDK. It's for the prereleases that
# build with .NET 11 before it's released, like powershell-preview. It ships nothing.
_dotnetver=11.0
pkgname=dotnet-build-deps-$_dotnetver-bin
# The version of Microsoft's .NET SDK (dotnet-sdk-preview-bin) like dotnet-build-deps-10.0-bin has the
# one of dotnet-sdk-bin: the runtime version and the SDK's feature band and patch, here with the
# prerelease and build. The SDK is pinned to exactly that release, so the version provided is the one
# installed.
pkgver=11.0.0.sdk100rc3.26522.148
pkgrel=1
pkgdesc="Build dependencies of the .NET packages from Microsoft's build of .NET $_dotnetver and nuget.org (meta package)"
arch=(x86_64 aarch64)
url='https://dotnet.microsoft.com/'
license=(0BSD)
# Microsoft's previews and release candidates of the next .NET, which has an epoch the version here
# leaves out
depends=("dotnet-sdk-preview-bin=1:$pkgver")
provides=("dotnet-build-deps-$_dotnetver=$pkgver")
conflicts=(
  "dotnet-build-deps-$_dotnetver"
  "dotnet-source-built-artifacts-$_dotnetver"
)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
