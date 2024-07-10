#! /bin/bash

# Sourced from:
PackageUrl="https://raw.githubusercontent.com/Askannz/optimus-manager/master/package"


DownloadFile () {
	local InFile="${1}"
	local OutFile="${2}"

	if [[ ! -f "${PWD}/${OutFile}" ]]; then
		curl --silent "${PackageUrl}/${InFile}" > "${PWD}/${OutFile}"
	fi
}


UpdateSrcInfo () {
	if [[ -z "${SRCINFO}" ]]; then
		export SRCINFO=x
		makepkg --printsrcinfo > ".SRCINFO"
	fi
}

DownloadFile "optimus-manager.install" "optimus-manager.install"
DownloadFile "PKGBUILD" "PKGBUILD-src"

source "${PWD}/PKGBUILD-src"
pkgver=r732.fced1de.python3.12
UpdateSrcInfo
